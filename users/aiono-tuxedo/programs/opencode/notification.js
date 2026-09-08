export const NotificationPlugin = async ({ $ }) => {
  return {
    event: async ({ event }) => {
      if (event.type === "session.idle") {
        await $`notify-send -u critical "OpenCode" "Session completed!"`;
      }
    },
  };
};
