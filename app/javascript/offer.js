document.addEventListener("DOMContentLoaded", function() {
  const form = document.getElementById("offer-form");
  const paytmNumberInput = document.getElementById("paytm_number");
  const appOfferIdInput = document.getElementById("app_offer_id");
  const upiIdInput = document.getElementById("upi_id");
  const referSubmitBtn = document.getElementById("refer");

  referSubmitBtn.addEventListener("click", function() {
    const upiId = upiIdInput.value;
    const appOfferId = appOfferIdInput.value;
    const paytmNumber = paytmNumberInput.value; // Retrieve Paytm number input field value here

    const referralCode = sessionStorage.getItem("referral_code");

    fetch("/admin/affiliates/", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content
      },
      body: JSON.stringify({
        app_offer_id: appOfferId,
        paytm_number: paytmNumber,
        upi_id: upiId,
        referral_code: referralCode
      })
    })
    .then(response => {
      if (!response.ok) {
        console.error("Error submitting referral:", response.statusText);
      } else {
        console.log("Referral submitted successfully!");
      }
    })
    .catch(error => {
      console.error("Error submitting referral:", error);
    });
  });
});
