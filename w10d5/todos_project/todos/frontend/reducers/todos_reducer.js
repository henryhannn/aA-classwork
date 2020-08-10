import { RECEIVE_TODO, RECEIVE_TODOS } from '../actions/todo_actions'

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
};

const todosReducer = (oldState = initialState, action) => {
    Object.freeze(oldState);
    let newState = {...oldState};
    switch (action.type) {
        case RECEIVE_TODOS:
            let newObject = {};
            action.todos.forEach(todo => {
                newObject[todo.id] = todo;
            });
            return newObject;
        case RECEIVE_TODO:
            newState[action.todo.id] = action.todo;
            return newState;
        default:
            return oldState;
    }
};

/*
const reducer = (oldState = _defaultState, action) => {
  switch(action.type) {
    case ADD_FRUIT:
      return {
        fruits: [
          ...oldState.fruits,
          action.fruit
        ]
      };
    case CLEAR:
      return _defaultState;
    default:
      return oldState;
  }
}
*/

export default todosReducer;

