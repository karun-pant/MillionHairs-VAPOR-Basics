import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("me", ":page") { req -> EventLoopFuture<View> in
        guard let page = req.parameters.get("page"),
              let pageNumber = Int(page) else {
                  throw Abort.init(.badRequest,
                                   reason: "You are trying to pass string '\(req.parameters.get("page") ?? "N/A")', need number")
        }
        
        return req.view.render("kap", ["name": "Karun Pant",
                                "number": "+91-9899952688",
                                "page": "\(pageNumber)"
                               ])
    }
    app.post("name") { req -> EventLoopFuture<View> in//InfoResponse in
        let info = try req.content.decode(Info.self)
//        return InfoResponse(response: res)
        print(info.name)
        return req.view.render("post_response", info)
    }
}
