import { queryAllUsers } from '../repository/users.repository';

export const getAllUsersController = async () => {
  return await queryAllUsers();
};
