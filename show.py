import os
from openpyxl import Workbook

def get_file_sizes(folder_path):
    file_sizes = {}
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        if os.path.isfile(file_path):
            file_sizes[filename] = os.path.getsize(file_path)
    return file_sizes

def write_to_excel(folder1, folder2, output_excel):
    workbook = Workbook()
    sheet = workbook.active

    file_sizes_folder1 = get_file_sizes(folder1)
    file_sizes_folder2 = get_file_sizes(folder2)

    # 写入表头
    sheet.append(["Filename", "static(Byte)", "dynamic(Byte)"])

    # 写入数据
    for filename in file_sizes_folder1.keys():
        size_folder1 = file_sizes_folder1.get(filename, "N/A")
        size_folder2 = file_sizes_folder2.get(filename, "N/A")
        sheet.append([filename, size_folder1, size_folder2])

    # 保存Excel文件
    workbook.save(output_excel)

if __name__ == "__main__":
    folder_path1 = "./libsodium-test"
    folder_path2 = "./libsodium-test-dynamic"
    output_excel_path = "file_sizes_comparison.xlsx"

    write_to_excel(folder_path1, folder_path2, output_excel_path)

