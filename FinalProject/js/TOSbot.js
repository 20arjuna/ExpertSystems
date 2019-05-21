

function validateInput(url)
{
  var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
  var regex = new RegExp(expression);
  if (!url.match(regex))
  {
    alert("Please enter a valid website name");
  }
}
function loading()
{
  url = document.getElementById("url").value;
  validateInput(String(url));
}
