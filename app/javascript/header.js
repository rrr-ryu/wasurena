function headerList (){
  const pullDownButton = document.getElementById('header-user-name')
  const pullDownList = document.getElementById('hidden')

  pullDownButton.addEventListener('mouseover', () => {
    pullDownButton.setAttribute("style", "background-color: #EEEEEE;");
  });
  
  pullDownButton.addEventListener('mouseleave', () => {
    pullDownButton.removeAttribute("style");
  });

  pullDownButton.addEventListener('click', () => {
    if (pullDownList.getAttribute("style") == "display: block;"){
      pullDownList.removeAttribute("style")
    } else {
      pullDownList.setAttribute("style", "display: block;");
    }
  });
};

window.addEventListener('load', headerList);