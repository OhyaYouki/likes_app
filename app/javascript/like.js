// const buildHTML = (XHR) => {
//   // const item = XHR.response.post;
//   const html = `
//           <i class="fa fa-heart" id="like-btn"></i>
//           `;
//   return html;
// };


// function post(){
//   const grayHeart = document.getElementsByClassName("gray-heart")
//   const unLike = document.getElementById("unlike-btn");
//   unLike.addEventListener("click",(e)=>{
//       e.preventDefault();
//       // const form = document.getElementById("form");
//       // const formData = new FormData(form);
//       const XHR = new XMLHttpRequest();
//       XHR.open("POST","/posts/post_id/likes",true);
//       XHR.responseType = "json";
//       XHR.send();
//       XHR.onload = () => {
//         if (XHR.status != 200) {
//           alert(`Error ${XHR.status}: ${XHR.statusText}`);
//           return null;
//         };
//         const html = `
//           <i class="fa fa-heart" id="like-btn"></i>
//           `;
//         grayHeart.innerHTML = html
//         // const list = document.getElementById("list");
        // const formText = document.getElementById("content");
        // list.insertAdjacentHTML("afterend",buildHTML(XHR));
        // formText.value = "";
//       };
//   });
// };

// window.addEventListener('load',post);