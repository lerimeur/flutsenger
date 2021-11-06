import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from './Users/user.entity';
import { UsersModule } from './Users/user.module';
import { ConvModule } from './Conversations/conv.module';
import { MessageEntity } from './Messages/message.entity';
import { MessageModule } from './Messages/message.module';
import { ConvEntity } from './Conversations/conv.entity';


@Module({
  imports: [
    TypeOrmModule.forRoot(
      {
        type: 'mysql',
        host: 'localhost',
        port: 3306,
        username: 'user',
        password: 'password',
        database: 'database',
        entities: [UserEntity, ConvEntity, MessageEntity],
        synchronize: true,
      },
      ),

    UsersModule,
    ConvModule,
    MessageModule,

  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
