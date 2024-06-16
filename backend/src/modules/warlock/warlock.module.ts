import { Module } from '@rws-framework/server/nest';
import { HomeController } from './controllers/home.controller';

@Module({
  controllers: [HomeController],
  providers: [],
})
export class WarlockModule {}