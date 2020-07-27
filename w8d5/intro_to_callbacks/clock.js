class Clock {
    constructor() {
        const date = new Date();
        this.hours = date.getHours();
        this.minutes = date.getMinutes();
        this.seconds = date.getSeconds();
        // 1. Create a Date object.
        // 2. Store the hours, minutes, and seconds.
        // 3. Call printTime.
        // 4. Schedule the tick at 1 second intervals.
        setInterval(() => {
            this._tick()
        }, 1000);
    };

    printTime() {
        let hours = (this.hours.toString().length === 1) ? "0" + this.hours.toString() : this.hours.toString();
        let minutes = (this.minutes.toString().length === 1) ? "0" + this.minutes.toString() : this.minutes.toString();
        let seconds = (this.seconds.toString().length === 1) ? "0" + this.seconds.toString() : this.seconds.toString();
        // Format the time in HH:MM:SS
        // Use console.log to print it.
        console.log(`${hours}:${minutes}:${seconds}`)
    }

    _tick() {
        this.seconds += 1;
        if (this.seconds >= 60) {
            this.seconds = 0;
            this.minutes += 1;
        }
        if (this.minutes >= 60) {
            this.minutes = 0;
            this.hours += 1;
        }
        if (this.hours >= 24) {
            this.seconds = 0;
            this.minutes = 0;
            this.hours = 0;
        }

        this.printTime();
        // 1. Increment the time by one second.
        // 2. Call printTime.
    }
}

const clock = new Clock();