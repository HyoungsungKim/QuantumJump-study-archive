#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void quickSort(vector<int>& nums, int from, int to) {
    if(from == to) {
        return;
    }

    int pivot = nums[from];
    int seperator = from;

    for (int i = from + 1; i < to; ++i) {
        if(nums[i] <= pivot) {
            seperator += 1;
            swap(nums[seperator], nums[i]);
        }
    }
    swap(nums[from], nums[seperator]);

    quickSort(nums, from, seperator);
    quickSort(nums, seperator + 1, to);
}

int main() {
    vector<int> nums;
    int numOfInput, num;
    cin >> numOfInput;
    for(int i = 0; i < numOfInput; ++i) {
        cin >> num;
        nums.push_back(num);
    }

    quickSort(nums, 0, nums.size());

    for(auto i : nums) {
        cout << i << " ";
    }
}