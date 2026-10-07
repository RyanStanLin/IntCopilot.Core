import SwiftUI

@main struct IntCopilotDemoApp: App {
    @StateObject private var store = DemoStore()
    var body: some Scene {
        WindowGroup {
            DemoRootView().environmentObject(store)
                .frame(minWidth: 0, minHeight: 0)
                .task { await store.diagnostics.startIfRequested() }
        }
        #if os(macOS)
        .defaultSize(width: 1340, height: 900)
        #endif
    }
}
