export const allTodos = ({ todos }) => {
    const arrIds = Object.keys(todos);
    return arrIds.map(keyId => todos[keyId]);
};

/*
Create a file reducers/selectors.js.
Export a function named allTodos that receives the entire state as an argument.
Use Object.keys(state.todos) to get the keys for the state.todos.
Map the array of todo ids to an array of todos.
Return your new array.
*/

// for testing:
// const initialState = {
//     todos: {
//         1: {
//             id: 1,
//             title: "wash car",
//             body: "with soap",
//             done: false
//         },
//         2: {
//             id: 2,
//             title: "wash dog",
//             body: "with shampoo",
//             done: true
//         }
//     },
        // reminder: {

        // }
// };