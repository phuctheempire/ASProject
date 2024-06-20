export default defineEventHandler(async (event) => {
    const body = await readBody(event)


    await event.context.prisma.article.create({
        data: {
            title: body.title,
            categoryid: body.categoryid,
            description: body.description,
            image: body.image,

        },
    })

    // setResponseStatus(event, 201)
    
    return { message: "User created" }
})