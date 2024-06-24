import {getServerSession} from '#auth'

export default eventHandler( async event => {

    // const body = await readBody(event)
    // const runtimeConfig = useRuntimeConfig()

    const session = await getServerSession(event)
    console.log(session)
    return session

    // const account = await event.context.prisma.users.findFirst({
    //     where:{
    //         username: body.username
    //     }
    // })

})