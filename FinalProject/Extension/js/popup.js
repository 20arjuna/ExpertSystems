var site = "";
console.log("bitch");
chrome.tabs.getSelected(null,function(tab) {
    var tablink = new URL(tab.url);
    site = tablink.hostname;
    document.getElementById("sitename").innerHTML = site + " may be trying to pull a fast one on you!";
});
