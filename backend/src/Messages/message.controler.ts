import { Body, Controller, Delete, Get, Param, Post } from '@nestjs/common';


import { UsersService } from '../Users/user.service';
import { AddMessageConvDto } from './dto/add-message';
import { MessageEntity } from './message.entity';
import { MessageService } from './message.service';
import { ConvService } from '../Conversations/conv.service';

@Controller('message')
export class MessageControler {
  constructor(
    private readonly messageService: MessageService,
    private readonly convService: ConvService,
  ) {}

  @Post()
  async create(@Body() dto: AddMessageConvDto): Promise<MessageEntity> {
    // const user = await this.userService.findOne(dto.user_uuid)
    const message = await this.messageService.create(dto);
    const conv = await this.convService.findOne(dto.conv_uuid);
    await this.convService.addMessage(conv, message);
    return message;
  }

  // @Post('/adduser')
  // async addUserToaConv(@Body() dto: AddUserConvDto): Promise<Message> {
  //   const conv = await this.messageService.findOne(dto.conv_uuid);
  //   const user = await this.userService.findOne(dto.user_uuid);
  //
  //   return await this.messageService.addUser(conv, user);
  // }

  // @Get()
  // findAll(): Promise<MessageEntity[]> {
  //   return this.messageService.findAll();
  // }
  //
  // @Get(':id')
  // findOne(@Param('id') id: string): Promise<MessageEntity> {
  //   return this.messageService.findOne(id);
  // }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<void> {
    return this.messageService.remove(id);
  }
}
