import { Body, Controller, Delete, Get, HttpException, Param, Post } from '@nestjs/common';

import { CreateConvDto } from './dto/create-conv.dto';
import { ConvService } from './conv.service';
import { ConvEntity } from './conv.entity';
import { UsersService } from '../Users/user.service';
import { AddUserConvDto } from './dto/add-user-conv.dto';

@Controller('conv')
export class ConvController {
  constructor(
    private readonly convService: ConvService,
    private  readonly userService: UsersService,
  ) {}

  @Post()
  async create(@Body() dto: CreateConvDto): Promise<ConvEntity> {
    const creator_user = await this.userService.findOne(dto.creator_user_uuid)
    
    const invite_user =  await this.userService.findOneByUserName(dto.user_username);
    console.log(creator_user);
    console.log(invite_user);
    return await this.convService.create(creator_user, invite_user, dto);
  }

  @Post('/adduser')
  async addUserToaConv(@Body() dto: AddUserConvDto): Promise<ConvEntity> {
    const conv = await this.convService.findOne(dto.conv_uuid);
    const user = await this.userService.findOne(dto.user_username);

    return await this.convService.addUser(conv, user);
  }

  @Get()
  findAll(): Promise<ConvEntity[]> {
    return this.convService.findAll();
  }

  @Get('/message/:id')
  async GetallmessageofConv(@Param('id') id: string): Promise<ConvEntity> {
    return this.convService.findOne(id);
  }

  @Get(':id')
  async findAllbyUserId(@Param('id') id: string): Promise<ConvEntity[]> {
    let tmp = await this.userService.findOne(id);
    console.log(tmp);
    return this.convService.findallbyuserid(tmp.conv);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<void> {
    return this.convService.remove(id);
  }
}
