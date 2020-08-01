
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  const dogLinks = [];
  for(let dog in dogs) {
    let a = document.createElement('a');
    a.innerHTML = dog;
    a.href = dogs[dog];
    let li = document.createElement('li');
    li.classList.add('dog-link');
    li.appendChild(a);
    dogLinks.push(li);
  }
  return dogLinks;
};

function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  const dogList = document.querySelector(".drop-down-dog-list");
  for(let i = 0; i < dogLinks.length; i++) {
    dogList.appendChild(dogLinks[i]);
  }
  const dogNav = document.querySelector(".drop-down-dog-nav");
  dogNav.addEventListener("mouseenter", handleEnter);
  dogNav.addEventListener("mouseleave", handleLeave);
};

function handleEnter() {
  const dogLinks = document.querySelectorAll(".dog-link");
  // const dogLinks = dogList.children;
  for(let i = 0; i < dogLinks.length; i++) {
    dogLinks[i].classList.add("temp");
  }
};

function handleLeave() {
  const dogLinks = document.querySelectorAll(".dog-link");
  for(let i = 0; i < dogLinks.length; i++) {
    dogLinks[i].classList.remove("temp");
  }
};

// mouseTarget.addEventListener("mouseenter", (e) => {
//   mouseTarget.style.border = "5px dotted orange";
//   enterEventCount++;
//   addListItem("This is mouseenter event " + enterEventCount + ".");
// });


attachDogLinks();