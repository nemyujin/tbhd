//
//  LibraryData.swift
//  TBHD
//
//  Created by tbhd on 2023/11/03.
//

import Foundation

struct CourseCard {
    let name: String
}

struct Region {
    let name: String
}

struct Course {
    let name: String
}

struct CourseMemo {
    let name: String
}

class LibraryData {
    static let shared = LibraryData()
    
    let CourseCards: [CourseCard] = [
        CourseCard(name: "대전"),
        CourseCard(name: "97즈"),
        CourseCard(name: "1"),
    ]
    
    let regions: [Region] = [
        Region(name: "아이돌"),
        Region(name: "아이돌"),
        Region(name: "아이돌"),
    ]
    
    let course: [Course] = [
        Course(name: "먹킷리스트 여행 편"),
        Course(name: "성지순례 코스 편"),
        Course(name: "1"),
    ]
    
    let coursememo: [CourseMemo] = [
        CourseMemo(name: "대전의 명물 ‘성심당’ 에 가서 꽈배기랑 모카번만 구매하여 대전인의 탄식을 자아내게 했던 NCT127. 그래서 준비한 대전의 딸! 안유진성심당 Pick과 함께 대전 먹킷리스트 당일치기 코스를 알아보자."),
        CourseMemo(name: "훈남즈로 유명한 남자 아이돌 1997년생 동갑내기 모임 97즈가 자주가는 맛집모음.zip"),
        CourseMemo(name: "1"),
    ]
    
   
}
