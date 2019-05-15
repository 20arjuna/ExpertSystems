var site = "";
chrome.tabs.getSelected(null,function(tab) {
    var tablink = new URL(tab.url);
    site = tablink.hostname;
    document.getElementById("sitename").innerHTML = site + " may be trying to pull a fast one on you!";



});
document.getElementById("analyze").addEventListener("click", function onClick(){
  fetch("http://127.0.0.1:5000/mainTOSBOT", {
    method: "POST",
    mode: "no-cors",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      "sitename": site
    })
  }).then(function (response) {
    console.log(response);
  }).catch(function(err) {
    console.error(err);
  })
});
// function loading()
// {
//   console.log("Loading baby");
// }
//
//document.getElementById("analyze").addEventListener('click', onClick);
