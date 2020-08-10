import React from 'react';
import uniqueId from '../../util/unique_util';

class TodoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: 0,
            title: "",
            body: "",
            done: false
        };

        this.handleSubmit = this.handleSubmit.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateBody = this.updateBody.bind(this);
        this.updateDone = this.updateDone.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.receiveTodo(this.state);
        this.setState({
            title: this.state.title ? this.state.title : '',
            body: this.state.body ? this.state.body : '',
            done: this.state.done ? this.state.done : '',
            id: uniqueId()
        });
    }

    updateTitle(e) {
        this.setState({ title: e.currentTarget.value });
    }

    updateBody(e) {
        this.setState({ body: e.currentTarget.value });
    }

    updateDone(e) {
        this.setState({ done: e.currentTarget.value });
    }

    render() {
        return (
            <div>
                <h1>Add a Todo</h1>
                <form onSubmit={this.handleSubmit} >
                    <label>Title:
                        <input type="text" value={this.state.title} onChange={this.updateTitle}/>
                    </label>
                    
                    <label>Body:
                        <input type="text" value={this.state.body} onChange={this.updateBody}/>
                    </label>

                    <label>Status:
                        <input type="text" value={this.state.done} onChange={this.updateDone}/>
                    </label>

                    <input type="submit" value="Submit Form"/>
                </form>
            </div>
        );
    }
}

export default TodoForm;