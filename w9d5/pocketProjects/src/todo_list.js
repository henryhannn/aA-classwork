const todos = JSON.parse(localStorage.getItem('todos')) || [];

const ul = document.querySelector('.todos');
const todoForm = document.querySelector('.add-todo-form');

function populateList() {
  ul.innerHTML = "";
    for(let i = 0; i < todos.length; i++) {
      const label = document.createElement("label");
      label.innerText = todos[i].value;
      let x = document.createElement("INPUT");
      x.setAttribute("type", "checkbox");
      if(todos[i].done === true) {
        x.checked = true;
      }

      const li = document.createElement("li");
      li.appendChild(label).appendChild(x);
      ul.appendChild(li);
    }
};


function addTodo(e) {
    e.preventDefault();
    let input = document.querySelector('input[name="add-todo"]');
    let value = input.value;
    const item = { value: value, done: false };
    todos.push(item);
    localStorage.setItem("todos", JSON.stringify(todos));
    todoForm.reset();
    populateList();
};

const markAsDone = (e) => {
    // e.preventDefault();
    // e.stopPropagation();
    let ele = e.target;
    ele.classList.toggle("done");
};
  

todoForm.addEventListener("submit", addTodo);
ul.addEventListener('click', markAsDone);

populateList();



/* <article
  id="electric-cars"
  data-columns="3"
  data-index-number="12314"
  data-parent="cars">
...
</article> */


// const article = document.querySelector('#electric-cars');
 
// article.dataset.columns // "3"
// article.dataset.indexNumber // "12314"
// article.dataset.parent // "cars"


// const addItem = (e) => {
//     e.preventDefault();
//     let input = document.querySelector('input[name="add-grocery"]');
//     let value = input.value;
//     const item = {value}; // same as {value: value}
//     lsItems.push(item);
//     localStorage.setItem('items', JSON.stringify(lsItems))
//     updateList();
//     groceryForm.reset();
// }