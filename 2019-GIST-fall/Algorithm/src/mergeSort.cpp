#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> mergeSort(const vector<int>& nums, int from, int to) {
    vector<int> leftSideVec;
    vector<int> rightSideVec;
    if(from != to) {
        leftSideVec = mergeSort(nums, from, (from + to)/2);
        rightSideVec = mergeSort(nums, (from + to)/2 + 1, to);
    } else {
        vector<int> element;
        element.push_back(nums[from]);
        return element;
    }

    vector<int> sortedVec;
    while(true) {
        if(leftSideVec.size() == 0) {
            sortedVec.insert(sortedVec.end(), rightSideVec.begin(), rightSideVec.end());
            break;
        }

        if(rightSideVec.size() == 0) {
            sortedVec.insert(sortedVec.end(), leftSideVec.begin(), leftSideVec.end());
            break;
        }

        if(leftSideVec.front() <= rightSideVec.front()) {
            sortedVec.push_back(leftSideVec.front());
            leftSideVec.erase(leftSideVec.begin());
        } else {
            sortedVec.push_back(rightSideVec.front());
            rightSideVec.erase(rightSideVec.begin());
        }        
    }
    return sortedVec;
}

int main() {
    vector<int> nums = {3,1,2,8,7,9};
    vector<int> sortedNums = mergeSort(nums, 0, nums.size() - 1);

    for (auto i : sortedNums) {
        cout << i << " ";
    }
}
