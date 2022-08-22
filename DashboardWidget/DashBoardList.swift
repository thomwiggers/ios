//
//  DashBoardList.swift
//  DashboardWidgetExtension
//
//  Created by Marino Faggiana on 20/08/22.
//  Copyright © 2022 Marino Faggiana. All rights reserved.
//

import SwiftUI
import WidgetKit

/*
 @Environment(\.colorScheme) var colorScheme

     var entry: Provider.Entry

     var bgColor: some View {
         colorScheme == .dark ? Color.red : Color.orange
     }

     var body: some View {
         ZStack {
             bgColor
             Text(entry.date, style: .time)
         }
     }
 */

struct ListWidgetEntryView: View {
    var entry: DashboardListEntry
    var body: some View {
        switch entry.dashboardDatas.isEmpty {
        case true:
            emptyDasboardView
        case false:
            bodyDasboardView
        }
    }

    var emptyDasboardView: some View {
        VStack(alignment: .center) {
            Text("Good morning")
                .font(.title)
                .bold()
            VStack {
                ForEach(1...5, id: \.self) { _ in
                    HStack {
                        Image(systemName: "")
                            .font(.system(size: 40.0))
                            .foregroundColor(.red)
                        VStack(alignment: .leading) {
                            Text("")
                                .font(.headline)
                            Text("")
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                        Spacer()
                    }
                    .padding(5)
                }
            }
        }.padding()
    }

    var bodyDasboardView: some View {
        VStack(alignment: .center) {
            Text("Good morning")
                .font(.title)
                .bold()
            VStack {
                ForEach(entry.dashboardDatas, id: \.id) { element in
                    Link(destination: element.url) {
                        HStack {
                            Image(element.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(element.title)
                                    .font(.headline)
                                Text(element.subTitle)
                                    .font(.subheadline)
                                    .foregroundColor(.accentColor)
                            }
                            Spacer()
                        }
                        .padding(5)
                    }
                }
            }
        }.padding()
    }
}

struct NCElementDashboard_Previews: PreviewProvider {
    static var previews: some View {
        let entry = DashboardListEntry(date: Date(), dashboardDatas: [])
        ListWidgetEntryView(entry: entry).previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
