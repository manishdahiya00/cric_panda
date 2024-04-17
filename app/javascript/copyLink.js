document.addEventListener("DOMContentLoaded", function () {
  var copyBtn = document.getElementById("copyBtn");
  var referralLink = document.getElementById("referLink");
  if (copyBtn && referralLink) {
    copyBtn.addEventListener("click", function () {
      var tempInput = document.createElement("input");
      tempInput.value = referralLink.text;
      document.body.appendChild(tempInput);
      tempInput.select();
      document.execCommand("copy");
      copyBtn.textContent = "Link Copied!";
      document.body.removeChild(tempInput);
    });
  }
});
