import { User } from '../models/user';

export const getAllUsersController = () => {
  return [{ id: 1, first_name: 'luis', last_name: 'carlon' } as User];
};
