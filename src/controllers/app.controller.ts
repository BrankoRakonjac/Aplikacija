import { Controller, Get, Post, Param } from '@nestjs/common';
import { Administrator } from 'entities/administrator.entity';
import { AdministratorService } from '../services/administrator/administrator.service';



@Controller()
export class AppController {
  constructor(
    private administratorService: AdministratorService
  ){}
  
  @Get()
  getHello(): string {
    return "hello world";
  }


}

