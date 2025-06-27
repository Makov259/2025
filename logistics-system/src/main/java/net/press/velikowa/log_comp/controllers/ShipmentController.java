package net.press.velikowa.log_comp.controllers;

import net.press.velikowa.log_comp.entities.Delivery;
import net.press.velikowa.log_comp.entities.Shipment;
import net.press.velikowa.log_comp.entities.User;
import net.press.velikowa.log_comp.service.DeliveryService;
import net.press.velikowa.log_comp.service.ShipmentService;
import net.press.velikowa.log_comp.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/admin/shipments")
public class ShipmentController {


    private final ShipmentService shipmentService;
    private final UserService userService;
    private final DeliveryService deliveryService;

    // Add constructor
    public ShipmentController(ShipmentService shipmentService,UserService userService,DeliveryService deliveryService) {
        this.shipmentService = shipmentService;
        this.userService = userService;
        this.deliveryService = deliveryService;
    }


    @GetMapping
    public String showShipmentsPage(Model model) {
        List<Shipment> shipments = shipmentService.findAll(); // ✅ Load from DB
        model.addAttribute("shipments", shipments);            // ✅ Add to model

        return "shipment/list"; // ✅ Renders your `list.html` page
    }


    @GetMapping("/create")
    public String showCreateShipmentForm(Model model) {
        model.addAttribute("shipment", new Shipment());
        model.addAttribute("clients", userService.getAllClients());
        model.addAttribute("clients", userService.getAllClients()); // reuse sender list
        model.addAttribute("couriers", userService.getAllCouriers());
        // Later we'll pass in employees, offices, delivery types etc.
        return "shipment/create";
    }



    @PostMapping("/save")
    public String saveShipment(@ModelAttribute("shipment") Shipment shipment,
                               @RequestParam("senderId") Long senderId,
                               @RequestParam("receiverId") Long receiverId,
                               @RequestParam("courierId") Long courierId,
                               @AuthenticationPrincipal org.springframework.security.core.userdetails.User userDetails) {

        // 🔑 Get actual user from DB
        User loggedInUser = userService.findByUsername(userDetails.getUsername());

        // 🔗 Set sender & receiver
        User sender = userService.getUserById(senderId);
        User receiver = userService.getUserById(receiverId);
        shipment.setSender(sender);
        shipment.setReceiver(receiver);

        // 🏢 Set origin office from logged-in employee
        shipment.setOriginOffice(loggedInUser.getOffice());

        // 🧾 Set who registered it
        shipment.setRegisteredBy(loggedInUser);

        // 🚚 Assign delivery with courier
        User courier = userService.getUserById(courierId);
        Delivery delivery = new Delivery();
        delivery.setCourier(courier);
        delivery.setShipment(shipment);
        shipment.setDelivery(delivery);

        // 💰 [Optional] calculate price (you can plug in your formula later)
        // shipment.setPrice(...);

        // 💾 Save
        shipmentService.save(shipment);

        return "redirect:/admin/shipments";
    }





    @GetMapping("/checkout/{shipmentId}")
    public String showCheckoutForm(@PathVariable Long shipmentId, Model model) {
        Shipment shipment = shipmentService.findById(shipmentId);
        model.addAttribute("shipment", shipment);
        return "shipment/checkout";
    }


    @PostMapping("/checkout")
    public String checkoutShipment(@RequestParam Long shipmentId,
                                   @RequestParam("deliveryType") Delivery.DeliveryType deliveryType,
                                   @RequestParam("clientMoney") double clientMoney) {

        Shipment shipment = shipmentService.findById(shipmentId);
        Delivery delivery = shipment.getDelivery();

        // 🧮 Calculate base cost
        double cost = shipment.getWeight() * 2.59;

        if (deliveryType == Delivery.DeliveryType.ADDRESS_DELIVERY) {
            cost += 15.0;
        }

        delivery.setCost(cost);
        delivery.setDeliveryType(deliveryType);
        delivery.setDeliveredAt(LocalDate.now());

        // 🧾 Save delivery
        deliveryService.save(delivery);

        // ✅ Mark shipment as delivered
        shipment.setStatus(Shipment.Status.DELIVERED);
        shipmentService.save(shipment);

        // 🧮 You can store clientMoney and calculate change if needed
        double change = clientMoney - cost;
        System.out.println("CHANGE TO GIVE: " + change);

        return "redirect:/admin/shipments";
    }




}
