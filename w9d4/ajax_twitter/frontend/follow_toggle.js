class FollowToggle {
  constructor(el) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id");
    this.followState = this.$el.data("initial-follow-state");
    
    this.render();
  }

  render() {
    if (this.followState === false) {
      this.$el.text("Follow!");
    } else if (this.followState === true) {
      this.$el.text("Unfollow!");
    }
  }

  handleClick() {
      preventDefault();
  }
}

module.exports = FollowToggle;