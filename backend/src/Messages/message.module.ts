import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { MessageEntity } from './message.entity';
import { MessageService } from './message.service';
import { MessageControler } from './message.controler';
import { ConvModule } from '../Conversations/conv.module';


@Module({
  imports: [TypeOrmModule.forFeature([MessageEntity]), ConvModule],
  providers: [MessageService],
  exports: [],
  controllers: [MessageControler],
})
export class MessageModule {}
