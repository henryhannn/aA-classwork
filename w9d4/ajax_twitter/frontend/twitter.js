const FollowToggle = require("./follow_toggle.js");

    $(() => {
        // const $el = $('.follow-toggle');
        // new FollowToggle($el);

        $('.follow-toggle').each((i, btn) => {
            new FollowToggle(btn);
        });
    });