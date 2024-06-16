import { HomeController } from './home.controller';
import { Test, TestingModule } from '@nestjs/testing';

import { describe, beforeEach, it, expect } from '@jest/globals';

describe('home.controller', () => {
  let homeController: HomeController;
  

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HomeController],
    }).compile();

    homeController = module.get<HomeController>(HomeController);
  });

  it('should be defined', () => {
    expect(homeController).toBeDefined();
  });
});