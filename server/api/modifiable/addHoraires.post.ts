export default defineEventHandler(async (event) => {
    const body = await readBody(event)


    await event.context.prisma.plan.create({
        data: {
            date : body.date,
            time: body.time,
            lieu: body.lieu,
            sportid: body.sportid,
        },
    })

    // setResponseStatus(event, 201)
    
    return { message: "User created" }
})