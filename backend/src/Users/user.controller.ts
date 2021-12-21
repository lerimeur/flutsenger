import {
  Body,
  Controller,
  Delete,
  Get,
  HttpException,
  Param,
  Post,
  UseGuards,
} from '@nestjs/common';

import { CreateUserDto } from './dto/create-user.dto';
import { UserEntity } from './user.entity';
import { UsersService } from './user.service';
import { ConvEntity } from '../Conversations/conv.entity';
import * as bcrypt from 'bcrypt';

@Controller('users')
export class UsersController {
  constructor(private readonly userService: UsersService) {}

  @Post()
  create(@Body() createUserDto: CreateUserDto): Promise<UserEntity> {
    return this.userService.create(createUserDto);
  }

  @Get()
  findAll(): Promise<UserEntity[]> {
    return this.userService.findAll();
  }

  // @Get('/conv/:id')
  // getconv(@Param('id') id: string): Promise<ConvEntity[]> {
  //   const tmp =  this.userService.getconv(id);
  //   console.log(tmp);
    
  //   return tmp;
  // }

  @Get(':username/:password')
   async login(@Param('username') username: string, @Param('password') password: string): Promise<UserEntity | HttpException> {
     const user =  await this.userService.findOneByUserName(username);
    if (await bcrypt.compare(password, user.password)) {
      console.log(user);
      
      return user;
    }
    return new HttpException('Forbidden', 403);
      
    
  }
  @Get(':username')
  findOneByUserName(@Param('username') username: string): Promise<UserEntity> {
    return this.userService.findOneByUserName(username);
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<UserEntity> {
    return this.userService.findOne(id);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<void> {
    return this.userService.remove(id);
  }


}
