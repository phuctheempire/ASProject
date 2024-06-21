import { getServerSession } from '#auth'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)


    
    const session = await getServerSession(event)
    if (!session) {
        return { message: "You are not authorized to perform this action" }
    }
    else{    
        if ( session?.user?.id === body.id){
            return { message: "User not created" }
        } else {
            await event.context.prisma.article.create({
                data: {
                    title: body.title,
                    categoryid: body.categoryid,
                    description: body.description,
                    image: body.image,
        
                },
            })
    }}


    // setResponseStatus(event, 201)
    
})