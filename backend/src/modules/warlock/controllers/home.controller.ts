import { Controller, Get } from '@rws-framework/server/nest';

@Controller('home')
export class HomeController {
  @Get()
  findAll(): string {
    return 'This action returns all cats';
  }
}