import { IsEmail,  IsNotEmpty } from 'class-validator';


export class CreateConvDto {
  @IsNotEmpty()
  title: string;
  @IsNotEmpty()
  creator_user_uuid: string;
  @IsNotEmpty()
  user_username: string;
}
