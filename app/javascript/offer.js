document.addEventListener("DOMContentLoaded", function() {
    const referButtons = document.getElementsByClassName("refer-btn");

    for (const referButton of referButtons) {
        referButton.addEventListener("click", function(event) {
            const paytmNumber = document.getElementById("paytm_number").value.trim();
            const upiId = document.getElementById("upi_id").value.trim();

            if (paytmNumber.length === 0 || upiId.length === 0) {
                event.preventDefault();
                alert("Please fill out both Paytm number and UPI ID.");
            }
        });
    }

    // Input event listeners for real-time validation
    const paytmNumberInput = document.getElementById("paytm_number");
    const upiIdInput = document.getElementById("upi_id");

    paytmNumberInput.addEventListener("input", toggleButtonState);
    upiIdInput.addEventListener("input", toggleButtonState);

    function toggleButtonState() {
        const paytmNumber = paytmNumberInput.value.trim();
        const upiId = upiIdInput.value.trim();
        const referButtons = document.getElementsByClassName("refer-btn");

        for (const referButton of referButtons) {
            if (paytmNumber.length === 0 || upiId.length === 0) {
                referButton.classList.add("disabled");
            } else {
                referButton.classList.remove("disabled");
                referButton.addEventListener("click",()=>{
                    const offerForm = document.getElementById("offer_form")
                    offerForm.submit()
                })
            }
        }
    }
});
