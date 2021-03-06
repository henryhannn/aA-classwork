/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const warm_up = __webpack_require__(/*! ./warmup.js */ \"./src/warmup.js\")\n// import warmUp from \"./warmup\";\n\nclass Clock {\n  constructor(clockElement) {\n    // 1. Create a Date object.\n    const currentTime = new Date();\n\n    // 2. Store the hour, minute, and second.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    // 3. Call printTime.\n    this.printTime();\n\n    // 4. Schedule the tick at 1 second intervals.\n    setInterval(this._tick.bind(this), 1000);\n    \n  }\n\n  // Format the time in HH:MM:SS\n    printTime() {\n      const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n      warm_up.htmlGenerator(timeString, clockElement);\n    //   return timeString\n  }\n\n  _tick() {\n    // 1. Increment the time by one second.\n    this._incrementSeconds();\n\n    // 2. Call printTime.\n    this.printTime();\n  }\n\n  _incrementSeconds() {\n    // 1. Increment the time by one second.\n    this.seconds += 1;\n    if (this.seconds === 60) {\n      this.seconds = 0;\n      this._incrementMinutes();\n    }\n  }\n\n  _incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n      this.minutes = 0;\n      this._incrementHours();\n    }\n  }\n\n  _incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n  }\n}\n\nconst clockElement = document.getElementById(\"clock\");\nconst clock = new Clock(clockElement);\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  const dogLinks = [];\n  for(let dog in dogs) {\n    let a = document.createElement('a');\n    a.innerHTML = dog;\n    a.href = dogs[dog];\n    let li = document.createElement('li');\n    li.classList.add('dog-link');\n    li.appendChild(a);\n    dogLinks.push(li);\n  }\n  return dogLinks;\n};\n\nfunction attachDogLinks() {\n  const dogLinks = dogLinkCreator();\n  const dogList = document.querySelector(\".drop-down-dog-list\");\n  for(let i = 0; i < dogLinks.length; i++) {\n    dogList.appendChild(dogLinks[i]);\n  }\n  const dogNav = document.querySelector(\".drop-down-dog-nav\");\n  dogNav.addEventListener(\"mouseenter\", handleEnter);\n  dogNav.addEventListener(\"mouseleave\", handleLeave);\n};\n\nfunction handleEnter() {\n  const dogLinks = document.querySelectorAll(\".dog-link\");\n  // const dogLinks = dogList.children;\n  for(let i = 0; i < dogLinks.length; i++) {\n    dogLinks[i].classList.add(\"temp\");\n  }\n};\n\nfunction handleLeave() {\n  const dogLinks = document.querySelectorAll(\".dog-link\");\n  for(let i = 0; i < dogLinks.length; i++) {\n    dogLinks[i].classList.remove(\"temp\");\n  }\n};\n\n// mouseTarget.addEventListener(\"mouseenter\", (e) => {\n//   mouseTarget.style.border = \"5px dotted orange\";\n//   enterEventCount++;\n//   addListItem(\"This is mouseenter event \" + enterEventCount + \".\");\n// });\n\n\nattachDogLinks();\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(_clock__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list.js */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list_js__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list_js__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const todos = JSON.parse(localStorage.getItem('todos')) || [];\n\nconst ul = document.querySelector('.todos');\nconst todoForm = document.querySelector('.add-todo-form');\n\nfunction populateList() {\n  ul.innerHTML = \"\";\n    for(let i = 0; i < todos.length; i++) {\n      const label = document.createElement(\"label\");\n      label.innerText = todos[i].value;\n      let x = document.createElement(\"INPUT\");\n      x.setAttribute(\"type\", \"checkbox\");\n      if(todos[i].done === true) {\n        x.checked = true;\n      }\n\n      const li = document.createElement(\"li\");\n      li.appendChild(label).appendChild(x);\n      ul.appendChild(li);\n    }\n};\n\n\nfunction addTodo(e) {\n    e.preventDefault();\n    let input = document.querySelector('input[name=\"add-todo\"]');\n    let value = input.value;\n    const item = { value: value, done: false };\n    todos.push(item);\n    localStorage.setItem(\"todos\", JSON.stringify(todos));\n    todoForm.reset();\n    populateList();\n};\n\nconst markAsDone = (e) => {\n    // e.preventDefault();\n    // e.stopPropagation();\n    let ele = e.target;\n    ele.classList.toggle(\"done\");\n};\n  \n\ntodoForm.addEventListener(\"submit\", addTodo);\nul.addEventListener('click', markAsDone);\n\npopulateList();\n\n\n\n/* <article\n  id=\"electric-cars\"\n  data-columns=\"3\"\n  data-index-number=\"12314\"\n  data-parent=\"cars\">\n...\n</article> */\n\n\n// const article = document.querySelector('#electric-cars');\n \n// article.dataset.columns // \"3\"\n// article.dataset.indexNumber // \"12314\"\n// article.dataset.parent // \"cars\"\n\n\n// const addItem = (e) => {\n//     e.preventDefault();\n//     let input = document.querySelector('input[name=\"add-grocery\"]');\n//     let value = input.value;\n//     const item = {value}; // same as {value: value}\n//     lsItems.push(item);\n//     localStorage.setItem('items', JSON.stringify(lsItems))\n//     updateList();\n//     groceryForm.reset();\n// }\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  if(htmlElement.hasChildNodes()) {\n    // htmlElement.empty();\n    htmlElement.innerHTML = \"\";\n  }\n    let p = document.createElement('p');\n    p.innerText = string;\n    htmlElement.appendChild(p);\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });