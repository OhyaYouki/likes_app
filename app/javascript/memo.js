const buildHTML = (XHR) => {
  const item = XHR.response.post;
  // jsでエラー文を出したい
  
  // console.log(item)
  // if (item.content == '') {
  //   debugger
  //   const html = `
  //   < if post.errors.any? >
  //     <div class="error-alert">
  //       <ul>
  //         < post.errors.full_messages.each do |message| %>
  //         <li class='error-message'> ${message} </li>
  //         < end >
  //       </ul>
  //     </div>
  //   < end >`
  //   return html

  //   tagName.forEach((tag) => {
  //     const childElement = document.createElement("div");
  //     childElement.setAttribute("class", "child");
  //     childElement.setAttribute("id", tag.id);
  //     childElement.innerHTML = tag.tag_name;
  //     searchResult.appendChild(childElement);
  //     const clickElement = document.getElementById(tag.id);
  //     clickElement.addEventListener("click", () => {
  //       document.getElementById("post_form_tag_name").value = clickElement.textContent;
  //       clickElement.remove();
  //     });
  //   });
  // } else {
  //   const html = `
  //   <div class="post">
  //     <div class="post-date">
  //       投稿日時:${item.created_at}
  //     </div>
  //     <div class="post-content">
  //       ${item.content}
  //     </div>
  //   </div>`;
  //   return html;
  // }


  const html = `
    <div class="post">
      <div class="post-date">
        投稿日時:${item.created_at}
      </div>
      <div class="post-content">
        ${item.content}
      </div>
    </div>`;
    return html;
};


function post(){
  const submit = document.getElementById("submit");
  submit.addEventListener("click",(e)=>{
      e.preventDefault();
      const form = document.getElementById("form");
      const formData = new FormData(form);
      const XHR = new XMLHttpRequest();
      XHR.open("POST","/posts",true);
      XHR.responseType = "json";
      XHR.send(formData);
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        };
        // debugger
        const list = document.getElementById("list");
        const formText = document.getElementById("content");
        list.insertAdjacentHTML("afterend",buildHTML(XHR));
        formText.value = "";
      };
  });
};

window.addEventListener('load',post);