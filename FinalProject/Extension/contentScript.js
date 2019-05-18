var button = document.getElementById("button");
button.addEventListener
(
  "click", function()
  {
    chrome.runtime.sendMessage
    (
      {
        type: 'info',
        value: 'Hello World from TOSbot'
      }
    )
  }
)
