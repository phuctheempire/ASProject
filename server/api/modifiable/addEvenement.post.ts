export default defineEventHandler(async (event) => {
    const body = await readBody(event)


    await event.context.prisma.evenement.create({
        data: {
            title: body.title,
            categoryid: body.categoryid,
            plan: body.plan,
        },
    })

    // setResponseStatus(event, 201)
    
    return { message: "User created" }
})