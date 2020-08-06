// // Phase 1 
class Store {
    constructor(rootReducer) {
        this.rootReducer = rootReducer;
        this.state = global.state; 
        this.getState = this.getState.bind(this); 
    }

    getState() {
        return Object.assign(this.state); 
    }
}

// Phase 2 
// const reducerCollection = {
//     users: reducerForUsers,
//     roles: reducerForRoles,
//     bananas: reducerForBananas,
//     entities: reducerForEntities
// }

const combineReducers = (reducerCollection) => {
    return function(prevState, action){
        let prevStateKey = Object.keys(prevState); 
        let actionKey = Object.keys(action); 
        if(!prevStateKey.some(ele => actionKey.includes(ele))) {
            return prevState; 
        } else {
            let key;
            actionKey.forEach(ele => {
                if(ele !== 'type') {
                    key = ele;
                }
            }); 
            let newState = Object.assign(prevState);
            newState[key] = reducerCollection[key](prevState, action);
            return newState; 
        }
    }
}

const myNoiseReducer = (prevState = "peace and quiet", action) => {
    switch (action.type) {
        case "noisy action":
            return action.noise;
        default:
            return prevState;
    }
};

const myNoisyAction = {
    type: "noisy action",
    noise: "Car alarm"
};

const myInconsequentialAction = {
    type: "a type no one cares about",
    data: {
        thisThing: "will not get used anyway"
    }
};

const myInitialState = {
    noise: "peace and quiet"
};

const myRootReducer = combineReducers({
    noise: myNoiseReducer,
});

let newState = myRootReducer(myInitialState, myInconsequentialAction);
console.log(newState);
// => { noise: "peace and quiet" }

newState = myRootReducer(newState, myNoisyAction)
// => { noise: "Car alarm" }
console.log(newState);

newState = myRootReducer(newState, myInconsequentialAction)
// => { noise: "Car alarm" }
console.log(newState);
