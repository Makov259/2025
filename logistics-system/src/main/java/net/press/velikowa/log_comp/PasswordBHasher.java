package net.press.velikowa.log_comp;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
public class PasswordBHasher {
    public static void main(String[] args) {
    /*    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String rawPassword = "123456";
        String encodedPassword = passwordEncoder.encode(rawPassword);
        System.out.println(encodedPassword);*/


           /*     String raw = "admin123";
                String hashed = "$2a$10$UVP.7J5LWEcLBAtWc7AIE0ssUSFiVfhgxutES9t.yXQXP.LcDSx2";

                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                System.out.println("Match? " + encoder.matches(raw, hashed));*/
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        System.out.println(encoder.encode("admin123"));
//        System.out.println(new BCryptPasswordEncoder().encode("admin123"));

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        // 👉 To encode a new password
        //  String hashed = encoder.encode("admin123");
        // System.out.println("Encoded: " + hashed);

        // 👉 To test a password against a hashed one
        boolean matches = encoder.matches("123456", "$2a$10$nrvVlKri9aRSKplHqFHVLOT7qBu5O0A6mr0sNSnYwVMmpRkrMxki.");
        System.out.println("Matches: " + matches);

    }
}
