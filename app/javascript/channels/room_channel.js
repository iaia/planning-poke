import consumer from "./consumer"

consumer.subscriptions.create({
  channel: "RoomChannel",
  room_id: document.querySelector('head').dataset.currentRoomId
}, {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    if (data['notify'] === 'new-issue') {
      window.app.getIssues();
    } else {
      window.app.getIssues();
      // alert(data['message']);
    }
  },

  speak: function(message) {
    return this.perform('speak', { message: message });
  }
});
