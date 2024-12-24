import {useState} from "react";

export const Congrats = () => {


    const [name, setName] = useState("");
    const [submittedName, setSubmittedName] = useState("");

    const handleSubmit = () => {
        setSubmittedName("Merry Christmas " + name + "🎄");
    }


    return (
        <div className="container-fluid">
            <div className="d-flex justify-content-center align-items-center vh-100 bg-light">
                <div className="row">
                    <div className="card border-dark">
                        <div className="card-header">
                            <div className="row">
                                <div className="col-12 text-center">
                                    <h3>Enter your name</h3>
                                </div>
                            </div>
                            <div className="row align-items-center">
                                <div className="col-7">
                                    <input className="form-control" type="text"
                                           onChange={(e) => setName(e.target.value)} />
                                </div>
                                <div className="col-5 d-flex align-items-center">
                                    <button className="btn btn-success w-100 h-100" onClick={handleSubmit}>
                                        Send ❤
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div className="card-body">
                            <div className="row">
                                <div className="col-12 text-center">
                                    {submittedName}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}