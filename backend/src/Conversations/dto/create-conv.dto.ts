import { IsEmail,  IsNotEmpty } from 'class-validator';


export class CreateConvDto {
  @IsNotEmpty()
  title: string;
  @IsNotEmpty()
  user_uuid: string;
}
