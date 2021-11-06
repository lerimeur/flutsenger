import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConvEntity } from './conv.entity';
import { ConvService } from './conv.service';
import { ConvController } from './conv.controller';
import { UsersModule } from '../Users/user.module';


@Module({
  imports: [TypeOrmModule.forFeature([ConvEntity]), UsersModule],
  providers: [ConvService],
  exports: [ConvService],
  controllers: [ConvController],
})
export class ConvModule {}
