import { queryAllEvents } from '../repository/events.repository';

export const getAllEventsController = async () => {
  return await queryAllEvents();
};
