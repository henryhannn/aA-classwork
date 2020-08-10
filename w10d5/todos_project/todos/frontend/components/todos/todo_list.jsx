import React from 'react';
import TodoListItem from './todo_list_item'
import TodoForm from './todo_form';

// export default () => <h3>Todo list goes here!</h3>
const TodoList = ({ todos, receiveTodo }) => {
    return (
        <div>
            <h3>This is the TodoList:</h3>
            <ul>
                {todos.map(todo => {
                    return (
                        <TodoListItem key={todo.id} todo={todo} />
                    );
                })}   
            </ul>
            <TodoForm receiveTodo={receiveTodo} />
        </div>
    );
};

export default TodoList;