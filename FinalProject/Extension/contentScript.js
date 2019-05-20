var button = document.getElementById("button")
button.addEventListener
(
  "click", function()
  {
    console.log("shit")
    chrome.runtime.sendMessage
    (
      {
        type: 'info',
        value: 'Hello World from TOSbot'
      }
    )
  }
)
