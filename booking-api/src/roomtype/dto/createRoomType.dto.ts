import { ApiProperty } from "@nestjs/swagger"
// import { Status } from "../entites/roomtype.entity"

export class CreateRoomTypeDTO{
    @ApiProperty()
    type_name: string
    
    @ApiProperty()
    description: string
    
    // // @ApiProperty()
    // // status: Status
    
    // @ApiProperty()
    // area: number

}