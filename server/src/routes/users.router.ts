import { Router } from 'express';
import { getAllUsersController } from '../controllers/users.controller';
let usersRouter = Router();

usersRouter.get('/', async (req, res) => {
  const allUsers = await getAllUsersController();
  return res.send(allUsers);
});

export { usersRouter };
