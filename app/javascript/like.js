function post(){
  const unlikeHeart = document.querySelectorAll("#unlike-btn")
  console.log(unlikeHeart)
  unlikeHeart.addEventListener("click",(e)=>{
    e.preventDefault();
    console.log("イベント発火")
  })
};



window.addEventListener('load',post);